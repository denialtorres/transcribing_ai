class ProcessTranscriptionJob < ApplicationJob
  queue_as :transcriber

  def perform(project_id)
    return unless project = Project.find_by(id: project_id)
    return unless project.project.file.attached?
    return unless project.pending? || project.failed?

    project.processing!
    Files.binwrite(Rails.root.join("tmp", project_id.to_s), project.file.download)

    # transcription = # TODO
    # if transcription && project.update(transcription: transcription)
    #   project.completed!
    # else
    #   project.failed!
    #   ProcessTranscriptionJob.set(wait: 10.seconds).perform_later(project_id)
    # end
    # Rescue transcriber
  ensure
    FileUtils.rm_rf(Rails.root.join("tmp", project_id.to_s))
  end
end
