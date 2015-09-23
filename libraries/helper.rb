require 'net/smtp'

module HandlerDemo
  class Helper

    def send_email_on_failure(node_name)

      message  = 'From: Chef <chef@chef.io>\n'
      message << 'To: Julian <jdunn@chef.io>\n'
      message << 'Subject: chef-client Run Failed\n'
      message << 'Date: #{Time.now.rfc2822}\n\n'
      message << 'Chef run failed on #{node.name}\n'
      Net::SMTP.start('localhost', 25) do |smtp|
        smtp.send_message message, 'chef@chef.io', 'jdunn@chef.io'
      end    
    end
  end
end
