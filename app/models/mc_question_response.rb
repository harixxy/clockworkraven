# Copyright 2012 Twitter, Inc. and others.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Represents a judge's response to a particular multiple-choice question.
# Associated with the MCQuestionOption the judge chose, as well as the
# TaskResponse, which represents the judges complete response to a task.
class MCQuestionResponse < ActiveRecord::Base
  has_and_belongs_to_many :mc_question_options
  belongs_to :task_response

  def mc_question
    if self.mc_question_options.blank?
      nil
    else
      self.mc_question_options.first.mc_question
    end
  end
end