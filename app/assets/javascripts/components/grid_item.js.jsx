var GridItem = React.createClass({
  render: function() {
    return <div>
      <h3>{this.props.post.title}</h3>
      <p>{this.props.post.content}</p>
    </div>
  }
});

var Grid = React.createClass({
  render: function() {
    return <div>
      {this.props.posts.map(function(post) {
        return <GridItem post={post} />;
      })}
    </div>;
  }
});

var posts = [
  { title: "The first post", content: "lorem ipsum" },
  { title: "The second post", content: "other lorem" }
];

React.render(<Grid posts={posts} />, document.body);



