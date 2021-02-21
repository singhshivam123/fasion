# frozen_string_literal: true

ActiveAdmin.register Seo do
  permit_params :url, :title, :keyword, :discription

  form do |f|
    f.inputs do
      f.input :url
      f.input :title
      f.input :keyword
      f.input :discription
    end
    f.actions
  end
end
