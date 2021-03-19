<div class="home-page-content">
  <div class="billboard">
    <div class="background-fill">
        <!-- Background fill goes here -->
    </div>
    <div class="billboard-content">
      <h4>Welcome to the EnContext Community</h4>
      <hr />
      <h1>
        When we work together, <br />
        we all win
      </h1>
      <h6>
        Join our community of small and medium sized businesses sharing
        knowledge in order to optimize and grow.
      </h6>
      <!-- Play Button -->
      <div class="actions">
        <button>Sign up</button>
        <button>Login</button>
      </div>
    </div>
  </div>

  <div class="content">
    <ul>
        <li>
            <form id="search-form" role="search" method="GET">
                <div id="search-fields">
                    <div class="form-group">
                        <input autocomplete="off" type="text" class="form-control" placeholder="[[global:search]]" name="query" value="">
                        <a href="#"><i class="fa fa-gears fa-fw advanced-search-link"></i></a>
                    </div>
                    <button type="submit" class="btn btn-default hide">[[global:search]]</button>
                </div>
            </form>
            <div id="quick-search-container" class="quick-search-container hidden">
                <div class="checkbox filter-category">
                    <label>
                        <input type="checkbox" checked><span class="name"></span>
                    </label>
                </div>
                <div class="text-center loading-indicator"><i class="fa fa-spinner fa-spin"></i></div>
                <div class="quick-search-results-container"></div>
            </div>
        </li>
        <li class="visible-xs" id="search-menu">
            <a href="{relative_path}/search">
                <i class="fa fa-search fa-fw"></i> [[global:search]]
            </a>
        </li>
    </ul>
    <h5>Get your questions answered</h5>
  
    <!-- IF canPost -->
			<!-- IMPORT partials/buttons/newTopic.tpl -->
			<!-- ELSE -->
			<a component="category/post/guest" href="{config.relative_path}/login" class="btn btn-primary">Log in to ask your question</a>
			<!-- ENDIF canPost -->
			<a href="{config.relative_path}/{selectedFilter.url}" class="inline-block">
				<div class="alert alert-warning hide" id="new-topics-alert"></div>
			</a>
  
    <h5>What's New</h5>

    <h5>Top Categories</h5>
    <ul class="categories">
      {{{each categories}}}
      <li>
        <div class="category-img">
      
        </div>
        <div class="category-label">
          {categories.name}
        </div>
      </li>
      {{{end}}}
    </ul>
    
  
    <h5>Education</h5>

  
    <h5>Hot in the Community</h5>

    <div class="category">
      <!-- IF !popular.length -->
      <div class="alert alert-warning" id="category-no-topics">[[recent:no_popular_topics]]</div>
      <!-- ENDIF !popular.length -->

      <!-- IMPORT partials/home/popular_topics.tpl -->
  
      <!-- IF config.usePagination -->
        <!-- IMPORT partials/paginator.tpl -->
      <!-- ENDIF config.usePagination -->
    </div>
        

	</div>
</div>
  </div>
</div>
