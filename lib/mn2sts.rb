require 'open3'
require 'mn2sts/version'

module Mn2sts
  MN2STS_JAR_PATH = File.join(File.dirname(__FILE__), '../bin/mn2sts.jar')

  def self.help
    cmd = ['java', '-jar', MN2STS_JAR_PATH].join(' ')
    message, error_str, status = Open3.capture3(cmd)
    message
  end

  def self.version
    cmd = ['java', '-jar', MN2STS_JAR_PATH, '-v'].join(' ')
    message, error_str, status = Open3.capture3(cmd)
    message.strip
  end

  def self.convert(xml_path_in, xml_path_out, opts = {})
    return if xml_path_in.nil? || xml_path_out.nil?

    puts MN2STS_JAR_PATH
    cmd = ['java', '-Xss5m', '-Xmx1024m', '-jar', MN2STS_JAR_PATH,
           '--xml-file-in', xml_path_in,
           '--xml-file-out', xml_path_out
          ].join(' ')

    cmd += " --output-format iso" if opts[:iso]

    puts cmd
    _, error_str, status = Open3.capture3(cmd)

    unless status.success?
      warn error_str
      raise error_str
    end
  end

end
