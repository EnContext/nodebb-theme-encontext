<div data-widget-area="header">
	{{{each widgets.header}}}
	{{widgets.header.html}}
	{{{end}}}
</div>
<div class="row">
	<div class="topic <!-- IF widgets.sidebar.length -->col-lg-9 col-sm-12<!-- ELSE -->col-lg-12<!-- ENDIF widgets.sidebar.length -->">
		<div class="topic-header">
			<h1 component="post/header" class="" itemprop="name">
				<span class="topic-title" component="topic/title">
					<span component="topic/labels">
						<i component="topic/pinned" class="fa fa-thumb-tack <!-- IF !pinned -->hidden<!-- ENDIF !pinned -->" title="[[topic:pinned]]"></i>
						<i component="topic/locked" class="fa fa-lock <!-- IF !locked -->hidden<!-- ENDIF !locked -->" title="[[topic:locked]]"></i>
						<i class="fa fa-arrow-circle-right <!-- IF !oldCid -->hidden<!-- ENDIF !oldCid -->" title="{{{ if privileges.isAdminOrMod }}}[[topic:moved-from, {oldCategory.name}]]{{{ else }}}[[topic:moved]]{{{ end }}}"></i>
						{{{each icons}}}{@value}{{{end}}}
					</span>
					{title}
				</span>
			</h1>

			<div class="topic-info clearfix">
				<div class="category-item inline-block">
					{{{ if category.icon }}}
					<div role="presentation" class="icon pull-left" style="{{{ if category.bgColor }}}background-color: {category.bgColor};{{{end}}}; {{{ if category.color}}}color: {category.color};{{{end}}}">
						<i class="fa fa-fw {category.icon}"></i>
					</div>
					{{{ end }}}
					<a href="{config.relative_path}/category/{category.slug}">{category.name}</a>

				</div>

				<div class="tags tag-list inline-block">
					<!-- IMPORT partials/topic/tags.tpl -->
				</div>
				<div class="inline-block">
					<!-- IMPORT partials/topic/stats.tpl -->
				</div>
				{{{ if rssFeedUrl }}}<a target="_blank" href="{rssFeedUrl}"><i class="fa fa-rss-square"></i></a>{{{ end }}}
				<!-- IMPORT partials/topic/browsing-users.tpl -->

				<!-- IMPORT partials/post_bar.tpl -->
			</div>
		</div>
		<!-- IF merger -->
		<div component="topic/merged/message" class="alert alert-warning clearfix">
			<span class="pull-left">[[topic:merged_message, {config.relative_path}/topic/{mergeIntoTid}, {merger.mergedIntoTitle}]]</span>
			<span class="pull-right">
				<a href="{config.relative_path}/user/{merger.userslug}">
					<strong>{merger.username}</strong>
				</a>
				<small class="timeago" title="{mergedTimestampISO}"></small>
			</span>
		</div>
		<!-- ENDIF merger -->

		<!-- IMPORT partials/topic/deleted-message.tpl -->

		<ul component="topic" class="posts" data-tid="{tid}" data-cid="{cid}">
			{{{each posts}}}
				<li component="post" class="<!-- IF posts.deleted -->deleted<!-- ENDIF posts.deleted -->" <!-- IMPORT partials/data/topic.tpl -->>
					<a component="post/anchor" data-index="{posts.index}" id="{posts.index}"></a>

					<meta itemprop="datePublished" content="{posts.timestampISO}">
					<meta itemprop="dateModified" content="{posts.editedISO}">

					<!-- IMPORT partials/topic/post.tpl -->
				</li>
			{{{end}}}
		</ul>

		<!-- IF config.enableQuickReply -->
		<!-- IMPORT partials/topic/quickreply.tpl -->
		<!-- ENDIF config.enableQuickReply -->

		<!-- IF config.usePagination -->
		<!-- IMPORT partials/paginator.tpl -->
		<!-- ENDIF config.usePagination -->

		<div class="navigator-thumb text-center hidden">
			<strong class="text"></strong><br/>
			<span class="time"></span>
		</div>
		<div class="visible-xs visible-sm pagination-block text-center">
			<div class="progress-bar"></div>
			<div class="wrapper">
				<i class="fa fa-2x fa-angle-double-up pointer fa-fw pagetop"></i>
				<i class="fa fa-2x fa-angle-up pointer fa-fw pageup"></i>
				<span class="pagination-text"></span>
				<i class="fa fa-2x fa-angle-down pointer fa-fw pagedown"></i>
				<i class="fa fa-2x fa-angle-double-down pointer fa-fw pagebottom"></i>
			</div>
		</div>
	</div>
	<div data-widget-area="sidebar" class="col-lg-3 col-sm-12 <!-- IF !widgets.sidebar.length -->hidden<!-- ENDIF !widgets.sidebar.length -->">
		{{{each widgets.sidebar}}}
		{{widgets.sidebar.html}}
		{{{end}}}
	</div>
</div>

<div data-widget-area="footer">
	{{{each widgets.footer}}}
	{{widgets.footer.html}}
	{{{end}}}
</div>

<!-- IF !config.usePagination -->
<noscript>
	<!-- IMPORT partials/paginator.tpl -->
</noscript>
<!-- ENDIF !config.usePagination -->
