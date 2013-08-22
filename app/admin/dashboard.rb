ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Omms" do
          ul do
            Omm.order("created_at desc").limit(5).map do |omm|
              li link_to("(#{ time_ago_in_words(omm.created_at) } ago) #{ truncate(omm.messages.last.text, length: 150, separator: ' ') }", [:admin, omm])
            end
          end
        end
      end
      column do
        panel "Recent Users" do
          ul do
            User.order("created_at desc").limit(5).map do |user|
              li link_to("(#{ time_ago_in_words(user.created_at) } ago) #{ user.email }", [:admin, user])
            end
          end
        end
      end
    end
  end
end
