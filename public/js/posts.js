$(function() {

  var Post = Backbone.Model.extend({
  })

  var Posts = Backbone.Collection.extend({
    model: Post,
    url: '/posts'
  });

  posts = new Posts;
})