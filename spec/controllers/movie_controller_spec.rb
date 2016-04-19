require 'spec_helper'

describe MoviesController do 
    
    describe "index can be reached" do
        it "gets the index with index" do
            get :index
            expect(response).to render_template("index")
        end
    end
    before :each do
      @fake_movie = stub('double').as_null_object
      @movie = [mock('movie1')]
    end
    describe 'updating movie info' do
      before :each do
        movie_id = 5
        Movie.should_receive(:find).with(movie_id.to_s).and_return(@fake_movie)
        @fake_movie.should_receive(:update_attributes!).exactly 1
        put :update, {:id => movie_id, :movie => @movie}
      end
      it 'should redirect to details template for rendering' do
        response.should redirect_to(movie_path @fake_movie)
      end
      it 'should make updated info available to template' do
        assigns(:movie).should == @fake_movie
      end

      it 'should redirect if selected ratings are changed' do
        get :index, {:ratings => {:G => 1}}
        response.should redirect_to(movies_path(:ratings => {:G => 1}))
      end
      it 'should call database to get movies' do
        Movie.should_receive(:find_all_by_rating)
        get :index
      end
    end

	  describe 'finding movies by same director' do
		  before :each do
			  @movie_id = 10
			  @selected = [mock('a movie'), mock('another one')]
			  @fake_movie.stub(:director).and_return('fake director')
		  end
		  it 'should render same_director view' do
			  Movie.stub(:find).and_return(@fake_movie)
			  Movie.stub(:find_all_by_director).and_return(@selected)

			  get :check_director, {:id => @movie_id}
			  response.should render_template 'check_director'
		  end
		  it 'should call Model method to get movies with same director' do
			  Movie.should_receive(:find).with(@movie_id.to_s).and_return(@fake_movie)
			  Movie.should_receive(:find_all_by_director).and_return(@selected)

			  get :check_director, {:id => @movie_id}
		  end
		  it 'should make selected movies available to the view' do
			  Movie.stub(:find).and_return(@fake_movie)
			  Movie.stub(:find_all_by_director).and_return(@selected)

			  get :check_director, {:id => @movie_id}

			  assigns(:movies).should == @selected
		  end
		  it 'should return to home page, if no movies found' do
			  empty_director =  double('movie', :director => '').as_null_object
			  Movie.stub(:find).and_return(empty_director)
			  Movie.stub(:find_all_by_director)
			
			  get :check_director, {:id => @movie_id}
			  response.should redirect_to("/movies")						
		  end
	  end
	  
	  describe 'create a new movie' do
	    it 'should render the new-movie template' do
	      get :new
	      response.should render_template 'new'
      end
      it 'should call a model method to persist data' do
        movie = stub('new movie').as_null_object
        Movie.should_receive(:create!).and_return(movie)
        post :create, {:movie => movie}
      end
      it 'should render home template' do
        movie = stub('new movie').as_null_object
        Movie.stub(:create!).and_return(movie)
  			post :create, {:movie => movie}
	  		response.should redirect_to(movies_path)
		  end
	  end
    
    describe 'delete an existing movie' do
		  it 'should render edit movie template' do
			  Movie.stub(:find)
			  get :edit, {:id => 5}
			  response.should render_template 'edit'
		  end
		  it 'should call a model method to update data' do
			  my_movie = mock('a movie').as_null_object
  			Movie.should_receive(:find).and_return(my_movie)
	  		my_movie.should_receive(:destroy)
  			delete :destroy, {:id => 1}
	  	end
	  end
	  
end