class RevisionsController < ApplicationController
  def show
    config_repositories = GithubRevisions.repositories
    current_repo = config_repositories.find {|repo| repo[:name] == params[:id]}
    if !current_repo
      redirect_first
    end
    revisions = get_revisions(current_repo)
    GithubAPI = GithubRevisions.github
    repositories = Array.new
    config_repos.each do |repo|
      git_repo = GithubAPI.repos.get(repo[:user], repo[:name])
      oss = git_repo.private
      url = git_repo.html_url
      repositories << {:name => repo[:name], :friendly => repo[:friendly], :url => url, :private => oss, :user => repo[:user]}
    end
    render 'show', :locals => { :current_repo => current_repo, :revisions => revisions, :repositories => repositories}
  end

  def index
    redirect_first
  end

  private

  def redirect_first
    return redirect_to revision_path(GithubRevisions.repositories[0][:name]), :alert => "Invalid Github repository."
  end
  
  def get_revisions(repository)
    # https://developer.github.com/v3/repos/commits/
    commits = Array.new
    GithubAPI = GithubRevisions.github
    github_commits = GithubAPI.repos.commits.all(repo[:user], repo[:name])
    github_commits.each do |response|
      author = response.commit.author.name
      sha = response.sha
      url = response.html_url
      message = response.commit.message
      date = response.commit.author.date
      commits << {:author => author, :sha => sha, :message => message, :date => date, :url => url}
    end
    return commits = Kaminari.paginate_array(commits).page(params[:page]).per(10)
  end
end
