class Event < ApplicationRecord
  enum :type_event, { task_created:0, task_completed:1, task_failed:2 }
end
