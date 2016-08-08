Puppet::Type.type(:puppetserver_config).provide(:augeas, parent: Puppet::Type.type(:augeasprovider).provider(:default)) do
  desc 'Uses the Augeas API to update a puppetserver native parameter'

  default_file { '/etc/puppetserver/conf.d/puppetserver.conf' }

  lens { 'Trapperkeeper.lns' }

  confine feature: :augeas

  resource_path do |resource|
    path = '$target'
    resource[:path].split('/').each do |p|
      path << "/@hash[.='#{p}']"
    end
    "#{path}/@#{type(resource)}[.='#{resource[:key]}']"
  end

  def self.type(resource)
    if resource[:type] == :array || (resource[:value] && resource[:value].length > 1)
      :array
    else
      :simple
    end
  end

  def set_paths(aug)
    path = '$target'
    resource[:path].split('/').map do |h|
      path << "/@hash[.='#{h}']"
      aug.set(path, h)
    end
  end

  def set_value(vals, aug)
    case self.class.type(resource)
    when :array
      # Replace all values
      aug.rm('$resource/*')
      Array(vals).each_with_index do |v, i|
        aug.set("$resource/#{i+1}", v)
      end
    else
      aug.set('$resource/@value', vals)
    end
  end

  def create
    augopen! do |aug|
      # Make sure intermediary paths exist
      set_paths(aug)
      # Make sure key path exists
      aug.defnode('resource', resource_path, resource[:key])
      set_value(resource[:value], aug)
    end
  end

  def value
    augopen do |aug|
      if aug.match('$resource/@value').empty?
        aug.match('$resource/*').map do |p|
          aug.get(p)
        end
      else
        [aug.get('$resource/@value')]
      end
    end
  end

  def value=(vals)
    augopen! do |aug|
      set_value(vals, aug)
    end
  end
end
