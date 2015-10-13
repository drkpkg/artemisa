class GroupTemplateController < ApplicationController

  def list_all
    #group_id = Group.find_by(group_name: params[:name])
    #@templates = Grouptemplate.where(groups_id: group_id.iPd)
    @templates = Grouptemplate.joins(:groups)
  end

end
