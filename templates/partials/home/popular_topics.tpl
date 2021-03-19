<ul component="category" class="topic-list" itemscope itemtype="http://www.schema.org/ItemList" data-nextstart="{nextStart}" data-set="{set}">
	<meta itemprop="itemListOrder" content="descending">
	{{{each popular}}}
	<li component="category/topic" class="row clearfix category-item {function.generateTopicClass}" <!-- IMPORT partials/data/category.tpl -->>
		<a id="{../index}" data-index="{../index}" component="topic/anchor"></a>
		<meta itemprop="name" content="{function.stripTags, title}">

		<div class="col-md-6 col-sm-9 col-xs-10 content">
			<div class="avatar pull-left">
				<!-- IF showSelect -->
				<div class="select" component="topic/select">
					<!-- IF popular.thumb -->
					<img src="{popular.thumb}" class="user-img not-responsive" />
					<!-- ELSE -->
					{buildAvatar(popular.user, "46", true, "not-responsive")}
					<!-- ENDIF popular.thumb -->
					<i class="fa fa-check"></i>
				</div>
				<!-- ENDIF showSelect -->

				<!-- IF !showSelect -->
				<a href="<!-- IF popular.user.userslug -->{config.relative_path}/user/{popular.user.userslug}<!-- ELSE -->#<!-- ENDIF popular.user.userslug -->" class="pull-left">
					<!-- IF popular.thumb -->
					<img src="{popular.thumb}" class="user-img not-responsive" />
					<!-- ELSE -->
					{buildAvatar(popular.user, "46", true, "not-responsive")}
					<!-- ENDIF popular.thumb -->
				</a>
				<!-- ENDIF !showSelect -->
			</div>

			<h2 component="topic/header" class="title">
				<i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !popular.pinned -->hide<!-- ENDIF !popular.pinned -->" title="{{{ if !../pinExpiry }}}[[topic:pinned]]{{{ else }}}[[topic:pinned-with-expiry, {../pinExpiryISO}]]{{{ end }}}"></i>
				<i component="topic/locked" class="fa fa-lock <!-- IF !popular.locked -->hide<!-- ENDIF !popular.locked -->" title="[[topic:locked]]"></i>
				<i component="topic/moved" class="fa fa-arrow-circle-right <!-- IF !popular.oldCid -->hide<!-- ENDIF !popular.oldCid -->" title="[[topic:moved]]"></i>
				{{{each popular.icons}}}{@value}{{{end}}}


				<!-- IF !popular.noAnchor -->
				<a href="{config.relative_path}/topic/{popular.slug}<!-- IF popular.bookmark -->/{popular.bookmark}<!-- ENDIF popular.bookmark -->" itemprop="url">{popular.title}</a><br />
				<!-- ELSE -->
				<span>{popular.title}</span><br />
				<!-- ENDIF !popular.noAnchor -->

				<!-- IF !template.category -->
				<small>
					<a href="{config.relative_path}/category/{popular.category.slug}"><span class="fa-stack fa-lg" style="{function.generateCategoryBackground, popular.category}"><i style="color:{popular.category.color};" class="fa {popular.category.icon} fa-stack-1x"></i></span> {popular.category.name}</a> &bull;
				</small>
				<!-- ENDIF !template.category -->

				<!-- IF popular.tags.length -->
				<span class="tag-list hidden-xs">
					{{{each popular.tags}}}
					<a href="{config.relative_path}/tags/{popular.tags.valueEscaped}"><span class="tag" style="<!-- IF popular.tags.color -->color: {popular.tags.color};<!-- ENDIF popular.tags.color --><!-- IF popular.tags.bgColor -->background-color: {popular.tags.bgColor};<!-- ENDIF popular.tags.bgColor -->">{popular.tags.valueEscaped}</span></a>
					{{{end}}}
					<small>&bull;</small>
				</span>
				<!-- ENDIF popular.tags.length -->

				<small class="hidden-xs"><span class="timeago" title="{popular.timestampISO}"></span> &bull; <a href="<!-- IF popular.user.userslug -->{config.relative_path}/user/{popular.user.userslug}<!-- ELSE -->#<!-- ENDIF popular.user.userslug -->">{popular.user.displayname}</a></small>
				<small class="visible-xs-inline">
					<!-- IF popular.teaser.timestamp -->
					<span class="timeago" title="{popular.teaser.timestampISO}"></span>
					<!-- ELSE -->
					<span class="timeago" title="{popular.timestampISO}"></span>
					<!-- ENDIF popular.teaser.timestamp -->
				</small>
			</h2>
		</div>

		<div class="mobile-stat col-xs-2 visible-xs text-right">
			<span class="human-readable-number">{popular.postcount}</span> <a href="{config.relative_path}/topic/{popular.slug}/{popular.teaser.index}"><i class="fa fa-arrow-circle-right"></i></a>
		</div>

		<div class="col-md-1 hidden-sm hidden-xs stats stats-votes">
			<!-- IF !reputation:disabled -->
			<span class="human-readable-number" title="{popular.votes}">{popular.votes}</span><br />
			<small>[[global:votes]]</small>
			<!-- END -->
		</div>

		<div class="col-md-1 hidden-sm hidden-xs stats stats-postcount">
			<span class="human-readable-number" title="{popular.postcount}">{popular.postcount}</span><br />
			<small>[[global:posts]]</small>
		</div>

		<div class="col-md-1 hidden-sm hidden-xs stats stats-viewcount">
			<span class="human-readable-number" title="{popular.viewcount}">{popular.viewcount}</span><br />
			<small>[[global:views]]</small>
		</div>


	</li>
	{{{end}}}
</ul>
