class Project < ApplicationRecord
  has_one_attached :file

  enum :status, [:pending, :processing, :failed, :completed]
end
