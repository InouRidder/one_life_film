var GridItem = React.createClass({
  render: function() {
    return <div>
    <h3> {this.props.grid.name} </h3>
    <img src={this.props.grid.picture}>
    </div>
  }
});

var Grid = React.createClass({
  render: function() {
    return <div>
    {this.props.items.map(function(item){
      return <GridItem item={item} />;
    })}
    </div>
  }
});

var GridItem = React.createClass({
  getInitialState: function() {
    return { activated: false}
  }

  render: function() {
     var divClasses = classNames({
      'activated': this.state.activated
    });

   return
    <div onClick={this.activate}>
      <h3> Hello {this.props.name} </h3>
    </div>

    }

  activate : function () {
  this.setState({ activated : true })
  }

});

var Grid = React.createClass({
  render: function() {
    return <div>
    {this.props.grids.map(function(item){
      return <GridItem item={item} />;
    })}
    </div>
  }
});


React.render(<GridItem name="Inou"/>, document.body);
