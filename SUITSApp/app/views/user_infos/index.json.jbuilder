# frozen_string_literal: true

json.array! @user_infos, partial: 'user_infos/user_info', as: :user_info
