Paperclip.interpolates :presentation_name  do |attachment, style|
   Presentation.find(attachment.instance.presentation_id).name
end
