<!-- IMPORT partials/breadcrumbs.tpl -->
<div data-widget-area="header">
	{{{each widgets.header}}}
		{{widgets.header.html}}
	{{{end}}}
</div>
<div class="popular">
	<div class="btn-toolbar">
		<div class="pull-left">
			<!-- IF canPost -->
				<!-- IMPORT partials/buttons/newTopic.tpl -->
			<!-- ELSE -->
			<a component="category/post/guest" href="{config.relative_path}/login" class="btn btn-primary">[[category:guest-login-post]]</a>
			<!-- ENDIF canPost -->
		</div>

		<div component="category/dropdown" class="btn-group pull-right category-dropdown-container <!-- IF !categories.length -->hidden<!-- ENDIF !categories.length -->">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
				<!-- IF selectedCategory --><!-- IF selectedCategory.icon --><span class="fa-stack"><i style="color: {selectedCategory.bgColor};" class="fa fa-circle fa-stack-2x"></i><i class="fa fa-fw fa-stack-1x {selectedCategory.icon}" style="color: {selectedCategory.color};"></i></span><!-- ENDIF selectedCategory.icon --> {selectedCategory.name}<!-- ELSE -->
				[[unread:all_categories]]<!-- ENDIF selectedCategory --> <span class="caret"></span>
			</button>
			<ul component="category/list" class="dropdown-menu category-dropdown-menu" role="menu">
				<li role="presentation" class="category">
					<a role="menu-item" href="{config.relative_path}/{allCategoriesUrl}"><i class="fa fa-fw <!-- IF !selectedCategory -->fa-check<!-- ENDIF !selectedCategory -->"></i> [[unread:all_categories]]</a>
				</li>
				<!-- BEGIN categories -->
				<li role="presentation" class="category" data-cid="{categories.cid}" data-parent-cid="{categories.parentCid}">
					<a role="menu-item" href="#"><i component="category/select/icon" class="fa fa-fw <!-- IF categories.selected -->fa-check<!-- ENDIF categories.selected -->"></i>{categories.level}<!-- IF categories.icon --><span class="fa-stack"><i style="color: {categories.bgColor};" class="fa fa-circle fa-stack-2x"></i><i class="fa fa-fw fa-stack-1x {categories.icon}" style="color: {categories.color};"></i></span><!-- ENDIF categories.icon --> {categories.name}</a>
				</li>
				<!-- END categories -->
			</ul>
		</div>

		<div class="btn-group pull-right <!-- IF !filters.length -->hidden<!-- ENDIF !filters.length -->">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			{selectedFilter.name} <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				{{{each filters}}}
				<li role="presentation" class="category">
					<a role="menu-item" href="{config.relative_path}/{filters.url}"><i class="fa fa-fw <!-- IF filters.selected -->fa-check<!-- ENDIF filters.selected -->"></i>{filters.name}</a>
				</li>
				{{{end}}}
			</ul>
		</div>

		<div class="btn-group pull-right <!-- IF !terms.length -->hidden<!-- ENDIF !terms.length -->">
			<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
			{selectedTerm.name} <span class="caret"></span>
			</button>
			<ul class="dropdown-menu" role="menu">
				{{{each terms}}}
				<li role="presentation" class="category">
					<a role="menu-item" href="{config.relative_path}/{terms.url}"><i class="fa fa-fw <!-- IF terms.selected -->fa-check<!-- ENDIF terms.selected -->"></i>{terms.name}</a>
				</li>
				{{{end}}}
			</ul>
		</div>
	</div>

	<hr class="hidden-xs"/>

	<div class="category">
		<!-- IF !topics.length -->
		<div class="alert alert-warning" id="category-no-topics">[[recent:no_popular_topics]]</div>
		<!-- ENDIF !topics.length -->

		<!-- IMPORT partials/topics_list.tpl -->

		<!-- IF config.usePagination -->
			<!-- IMPORT partials/paginator.tpl -->
		<!-- ENDIF config.usePagination -->
	</div>
</div>