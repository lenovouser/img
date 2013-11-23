ActiveAdmin.register_page "Dashboard" do

  menu :priority => 1, :label => proc{ I18n.t("active_admin.dashboard") }

  content :title => proc{ I18n.t("active_admin.dashboard") } do
    columns do
      column do
        panel "Recent Images" do
          table_for Image.order("created_at desc").limit(5) do
            column :created_at
            column :image do |image|
              image_tag image.image.url(:thumb), :width => 200
            end
            column :remote_addr
          end
        end
      end
    end
  end
end
