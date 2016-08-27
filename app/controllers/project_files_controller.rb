class ProjectFilesController < ApplicationController
  before_action :set_fabmoment

  def create
    add_more_project_files(project_files_params[:project_files])
    flash[:error] = "Failed uploading project files" unless @fabmoment.save
    redirect_back(fallback_location: edit_fabmoment_path)
  end

  def destroy
    remove_project_file_at_index(params[:id].to_i)
    flash[:error] = "Failed deleting project file" unless @fabmoment.save
    redirect_back(fallback_location: edit_fabmoment_path)
    head :ok
  end

  private

  def set_fabmoment
    @fabmoment = Fabmoment.find(params[:fabmoment_id])
  end

  def add_more_project_files(new_project_files)
    project_files = @fabmoment.project_files 
    project_files += new_project_files
    @fabmoment.project_files = project_files
  end

  def remove_project_file_at_index(index)
    remain_project_files = @fabmoment.project_files # copy the array
    deleted_project_file = remain_project_files.delete_at(index) # delete the target project_file
    deleted_project_file.try(:remove!) # delete project_file from S3
    @fabmoment.project_files = remain_project_files # re-assign back
  end

  def project_files_params
    params.require(:fabmoment).permit({project_files: []}) # allow nested params as array
  end
end