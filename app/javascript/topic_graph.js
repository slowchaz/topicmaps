var svg = d3.select("#graph");

// Create the link lines.
var link = svg
  .selectAll("line")
  .data(links)
  .enter()
  .append("line")
  .style("stroke", "#000");

// Create the node circles.
var node = svg
  .selectAll("circle")
  .data(nodes)
  .enter()
  .append("circle")
  .attr("r", 5)
  .style("fill", "#000");

// Append text labels to nodes
var labels = svg
  .selectAll("text")
  .data(nodes)
  .enter()
  .append("text")
  .text(function (d) {
    return d.content ? d.content : d.name;
  })
  .attr("font-family", "sans-serif")
  .attr("font-size", "10px")
  .attr("fill", "black");

// Assuming you're using a force simulation, you'll want to create and configure it here
var simulation = d3
  .forceSimulation(nodes)
  .force(
    "link",
    d3.forceLink(links).id(function (d) {
      return d.id;
    })
  )
  .force("charge", d3.forceManyBody())
  .force("center", d3.forceCenter(400, 300));

// You'll also want to handle the 'tick' event to update positions
simulation.on("tick", function () {
  link
    .attr("x1", function (d) {
      return d.source.x;
    })
    .attr("y1", function (d) {
      return d.source.y;
    })
    .attr("x2", function (d) {
      return d.target.x;
    })
    .attr("y2", function (d) {
      return d.target.y;
    });

  node
    .attr("cx", function (d) {
      return d.x;
    })
    .attr("cy", function (d) {
      return d.y;
    });

  labels
    .attr("x", function (d) {
      return d.x;
    })
    .attr("y", function (d) {
      return d.y;
    });
});
