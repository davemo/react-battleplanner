`/** @jsx React.DOM */`

defaultUnits = require("../data/builds_default_units.js").defaultUnits()

StatEditor = React.createClass

  getInitialState: ->
    {data: _(defaultUnits).findWhere(name: "raidmaster")}

  render: ->
    statNodes = _(@state.data.stats).map (stat) ->
      `<li className={stat.name}>
        <span className="current">{stat.current}</span>/<span className="max">{stat.max}</span>
        <span className="icon"></span>
      </li>`

    unit = @state.data
    rankClasses = "rank#{unit.rank}"
    portraitClasses = "portrait #{unit.name}"

    `<div className="wrapper">
      <div className="title-and-controls">
        <div className="title">{unit.name} - (rank <span className="rank">{unit.rank}</span>)</div>
        <div className="controls">
          <span className="done">Done Editing</span>
          <span className="reset">Reset to Minimums</span>
          <span className="total">
            <span className="allocated">{unit.current}</span>/<span className="max">{unit.max}</span>
          </span>
          <span id="rank-changer" className={rankClasses}>
            <span className="ui-title">Rank</span>
            <span className="set-rank-1 change-rank">1</span><span className="set-rank-2 change-rank">2</span><span className="set-rank-3 change-rank">3</span>
          </span>
        </div>
      </div>

      <div className={portraitClasses}></div>

      <ul className="stats">{statNodes}</ul>
    </div>`

module.exports = StatEditor
