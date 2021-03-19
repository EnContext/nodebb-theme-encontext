"use strict"

const nconf = require.main.require("nconf")
const winston = require.main.require("winston")
// const controllers = require('./templates/lib/controllers');
// const recentController = require('src/controllers/recent');
const Categories = require.main.require("./src/categories")
const db = require.main.require("./src/database")
const plugin = {}

plugin.init = async (params) => {
  const { router, middleware, controllers } = params
  const routeHelpers = require.main.require("./src/routes/helpers")

  /**
   * We create two routes for every view. One API call, and the actual route itself.
   * Use the `setupPageRoute` helper and NodeBB will take care of everything for you.
   *
   * Other helpers include `setupAdminPageRoute` and `setupAPIRoute`
   * */
  routeHelpers.setupPageRoute(
    router,
    "/home",
    middleware,
    [
      (req, res, next) => {
        setImmediate(next)
      },
    ],
    async (req, res) => {
      // Get What's new from EnContext Blogs
      const whatsNew = await Categories.getCategoryTopics(
        {
          cid: 5,
          start: 0,
          stop: 1,
        }
      )

      winston.info(JSON.stringify(whatsNew.topics))

      // Get our categories list
      const categoryList = await Categories.getAllCategories();

      // Get education topics
      const education = await Categories.getCategoryTopics(
        {
          cid: 6,
          start: 0,
          stop: 3,
        }
      )

      // Get the popular topics
      let popular
      popular = await controllers.recent.getData(req, "popular", "posts")
      winston.info(
        `[plugins/EnContext] Navigated to ${nconf.get("relative_path")}/home`
      )
      //   winston.info(JSON.stringify(popular))
      res.render("./home.tpl", {
        popular: popular.topics,
        categories: categoryList,
        whatsNew: whatsNew.topics,
        education: education.topics
      })
    }
  )
  routeHelpers.setupAdminPageRoute(
    router,
    "/admin/plugins/encontext",
    middleware,
    [],
    controllers.renderAdminPage
  )
}

/**
 * If you wish to add routes to NodeBB's RESTful API, listen to the `static:api.routes` hook.
 * Define your routes similarly to above, and allow core to handle the response via the
 * built-in helpers.formatApiResponse() method.
 *
 * In this example route, the `authenticate` middleware is added, which means a valid login
 * session or bearer token (which you can create via ACP > Settings > API Access) needs to be
 * passed in.
 *
 * To call this example route:
 *   curl -X GET \
 * 		http://example.org/api/v3/plugins/foobar/test \
 * 		-H "Authorization: Bearer some_valid_bearer_token"
 *
 * Will yield the following response JSON:
 * 	{
 *		"status": {
 *			"code": "ok",
 *			"message": "OK"
 *		},
 *		"response": {
 *			"foobar": "test"
 *		}
 *	}
 */

module.exports = plugin
