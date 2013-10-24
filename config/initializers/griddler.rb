Griddler.configure do |config|
  config.processor_class = Ommceptionist
  config.email_service = :mandrill
end

module Griddler
  module Adapters
    class MandrillAdapter
      def normalize_params
        events.map do |event|
          {
            to: recipients(event),
            from: event[:from_email],
            subject: event[:subject],
            text: event[:text],
            html: event[:html],
            raw_body: event[:raw_msg],
            attachments: attachment_files(event),
            headers: event[:headers]
          }
        end
      end
    end
  end

  class Email
    def initialize(params)
      @params = params

      @to = recipients
      @from = extract_address(params[:from], config.from)
      @subject = params[:subject]

      @body = extract_body
      @raw_text = params[:text]
      @raw_html = params[:html]
      @raw_body = @raw_text || @raw_html

      @headers = params[:headers]

      @attachments = params[:attachments]
    end
  end
end
