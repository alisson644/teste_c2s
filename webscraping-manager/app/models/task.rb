class Task < ApplicationRecord
  enum :status, { pending: 0, in_progress: 1, completed: 2, failed: 3 }

  URL_DOMAIN = /\A^https?:\/\/(?:www\.)?webmotors\.com\.br(?:\/|#|\?|$)/

  validates :title, presence: true
  validates :url, presence: true,
                  format: { with: URL_DOMAIN }

  after_create_commit { broadcast_prepend_to "task" }
  after_update_commit { broadcast_replace_to "task" }
  after_destroy_commit { broadcast_remove_to "task" }
end
