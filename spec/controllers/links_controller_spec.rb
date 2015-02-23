require 'spec_helper'
require 'load_rails'

describe LinksController, type: :controller do

  describe 'GET index' do
    subject { get :index }

    it 'assigns an instance variable' do
      subject
      expect(assigns(:links)).to eq Link.all
    end

    it 'responds with success' do
      subject
      expect(response.status).to eq 200
    end

    it 'renders index template' do
      expect(subject).to render_template 'index'
    end
  end

  describe 'GET new' do
    subject { get :new }

    it 'assigns an instance variable' do
      subject
      expect(assigns(:link)).to be_a_new Link
    end

    it 'responds with success' do
      subject
      expect(response.status).to eq 200
    end

    it 'renders new template' do
      expect(subject).to render_template 'new'
    end
  end

  describe 'POST create' do
    let(:url) { 'http://google.com' }
    subject   { post :create, link: { url: url }, format: :json }

    context 'legit url' do
      it 'successfully creates' do
        subject
        expect(response.status).to eq 200
      end
    end

    context 'not a url' do
      let(:url) { 'puppies' }
      it 'does not succeed' do
        subject
        expect(response.status).to eq 422
      end
    end
  end

  describe 'PUT update' do
    let(:new_url) { 'http://kittens.com' }
    let(:params)  {{ link: { url: new_url }, id: Link.last.id }}
    subject { patch :update, params }
    before  { Link.create(url: 'http://google.com') }

    it 'updates successfully' do
      subject
      expect(Link.last.url).to eq new_url
    end
  end

  describe 'DELETE destroy' do
    let(:id) { Link.last.id }
    subject { delete :destroy, id: id }

    before  { Link.create(url: 'http://google.com') }
    it 'deletes the record' do
      subject
      expect(Link.find_by_id(id)).to be_nil
    end
  end

end

