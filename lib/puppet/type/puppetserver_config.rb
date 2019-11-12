Puppet::Type.newtype(:puppetserver_config) do
  @doc = 'Manages puppetserver native config entries.'

  ensurable

  newparam(:name, namevar: true) do
    desc 'The default namevar.'
  end

  newparam(:key, namevar: true) do
    desc 'The setting name.'
  end

  newparam(:path, namevar: true) do
    desc 'The path to the setting in the file.'
  end

  newparam(:type, namevar: true) do
    desc 'The type of setting.'

    newvalues(:simple, :array)
    defaultto(:simple)
  end

  newparam(:target) do
    desc "The file in which to store the settings, defaults to
`/etc/puppetserver/conf.d/puppetserver.conf`."

    validate do |v|
      unless Puppet::Util.absolute_path? v
        raise ArgumentError, 'target must be an absolute path'
      end
    end
  end

  def self.title_patterns
    [
      [
        %r{^((\/.+\.conf)\/(.+)\/([^\/]+))$},
        [
          [:name],
          [:target],
          [:path],
          [:key]
        ]
      ],
      [
        %r{(.*)},
        [
          [:name]
        ]
      ]
    ]
  end

  newproperty(:value, array_matching: :all) do
  end

  autorequire(:file) do
    self[:target]
  end
end
