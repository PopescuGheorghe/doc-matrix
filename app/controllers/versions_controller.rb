class VersionsController < ApplicationController
  before_action :set_document_and_version, only: [:diff, :rollback, :destroy]

  #show the modifications of a documents
  def diff
  end

  # change the current document to the specified version
  # reify gives you the object of this version
  def rollback
    document = @version.reify
    document.save
    redirect_to edit_document_path(document)
  end

  private

  #return the desired version of a document
  def set_document_and_version
    @document = Document.find(params[:document_id])
    @version = @document.versions.find(params[:id])
  end
end