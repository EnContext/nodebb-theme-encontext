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
    <form id="searchBarWidget" class= "{hideOnTags} {hideOnUnread} {hideOnTopic} {hideOnHome} {hideOnCategories} {hideOnCategory} {hideOnRecent} {hideOnPopular}">
      <div class="form-group" id="search-widget-fields">
          <div class="input-group">
              <input id="searchBarWidgetInput" type="text" class="form-control" placeholder="Search" name="query1" value="" autocomplete="off">
              <a class="input-group-addon search-button">
                  <i class="fa fa-search fa-fw"></i>
              </a>
          </div>
      </div>
      <ul class='search-bar-suggestions' style="display: none;">
      <!-- BEGIN searchBarWidgetSuggestions -->
          <li>
              <a href='/topic/{searchBarWidgetSuggestions.topic.slug}'>
                 <h5>
                      {searchBarWidgetSuggestions.topic.title}
                  </h5>
                  <p>
                      {searchBarWidgetSuggestions.contentText}
                  </p>
              </a>
          </li>
      <!-- END searchBarWidgetSuggestions -->
      </ul>
  </form>

    <h5>Get your questions answered</h5>
    <div class="topic-list-header btn-toolbar">
      <div class="pull-left">
        <!-- IF canPost -->
        <!-- IMPORT partials/buttons/newTopic.tpl -->
        <!-- ELSE -->
        <a component="category/post/guest" href="{config.relative_path}/login" class="btn btn-primary">Ask your question</a>
        <!-- ENDIF canPost -->
      </div>
    </div>


    <h5>What's New</h5>
    <ul class="whats-new">
      {{{each whatsNew}}}
      <li class="new-topic">
        <p>{whatsNew.title}</p>
      </li>
      {{{end}}}
    </ul>

    <h5>Top Categories</h5>
    <ul class="categories">
      {{{each categories}}}
      <li>
        
        <!-- IF categories.backgroundImage -->
        <div class="category-img" style="background-image: url({categories.backgroundImage})">
          <div class="color-overlay"></div>
        </div>
        <!-- ELSE -->
        <div class="category-img" style="background-color: {categories.bgColor}">
          <i class="fa {categories.icon}"></i>
        </div>
            <!-- ENDIF categories.backgroundImage -->
        <div class="category-label">
          {categories.name}
        </div>
      </li>
      {{{end}}}
    </ul>
    
  
    <h5>Education</h5>
    <ul class="education">
      {{{each education}}}
      <li>
        <p>{education.title}</p>
      </li>
      {{{end}}}
    </ul>
  
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
