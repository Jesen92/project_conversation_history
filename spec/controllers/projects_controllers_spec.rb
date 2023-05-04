# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:user) { create(:user) }
  let(:projects) { create_list(:project, 3) }
  let(:project) { projects.first }

  before do
    project
    sign_in user
  end

  describe 'GET index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'assigns @projects' do
      get :index
      expect(assigns(:projects)).to eq(projects)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET show' do
    it 'returns a successful response' do
      get :show, params: { id: project }
      expect(response).to be_successful
    end

    it 'assigns @project' do
      get :show, params: { id: project }
      expect(assigns(:project)).to eq(project)
    end

    it 'renders the show template' do
      get :show, params: { id: project }
      expect(response).to render_template('show')
    end
  end

  describe 'GET new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template('new')
    end
  end

  describe 'POST create' do
    let(:new_project_params) do
      {
        project: {
          title:,
          description: 'Description123'
        }
      }
    end
    let(:title) { 'New project' }

    it 'creates a new project' do
      expect {
        post :create, params: new_project_params
      }.to change(Project, :count).by(1)
    end

    it 'renders the show template' do
      post :create, params: new_project_params
      expect(response).to redirect_to(project_path(Project.last))
    end

    context 'when create raises an Exception::ValidationError' do
      let(:title) { nil }

      it 'renders the new template' do
        post :create, params: new_project_params
        expect(response).to render_template('new')
      end
    end
  end

  describe 'GET edit' do
    it 'returns a successful response' do
      get :edit, params: { id: project }
      expect(response).to be_successful
    end

    it 'assigns @project' do
      get :edit, params: { id: project }
      expect(assigns(:project)).to eq(project)
    end

    it 'renders the edit template' do
      get :edit, params: { id: project }
      expect(response).to render_template('edit')
    end
  end

  describe 'PATCH update' do
    let(:new_project_params) do
      {
        id: project,
        project: {
          title:,
          description:
        }
      }
    end
    let(:title) { 'New project' }
    let(:description) { 'Description123' }

    it 'updates a project' do
      patch :update, params: new_project_params
      expect(project.reload.title).to eq(title)
      expect(project.reload.description.body.to_s).to eq(ActionText::RichText.new(name: 'description',
                                                                                  body: description).body.to_s)
    end

    it 'renders the show template' do
      patch :update, params: new_project_params
      expect(response).to redirect_to(project_path(project))
    end

    context 'when create raises an Exception::ValidationError' do
      let(:title) { nil }

      it 'renders the new template' do
        patch :update, params: new_project_params
        expect(response).to render_template('edit')
      end
    end
  end

  describe 'DELETE destroy' do
    it 'deletes a project' do
      expect {
        delete :destroy, params: { id: project }
      }.to change(Project, :count).by(-1)
    end

    it 'renders the show template' do
      delete :destroy, params: { id: project }
      expect(response).to redirect_to(projects_path)
    end
  end
end
