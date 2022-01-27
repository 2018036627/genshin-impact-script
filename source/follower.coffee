# function

class FollowerX

  intervalCheck: 1e3
  isMoving: false
  tsCheck: 0

  constructor: ->
    Client.on 'tick', @check

  check: ->

    unless Scene.name == 'normal' then return

    now = $.now()
    unless now - @tsCheck >= @intervalCheck then return
    @tsCheck = now

    unless @detect()
      @rotate()
      return

    @move()

  detect: ->

    start = Point.new ['3%', '2%']
    end = Point.new ['14%', '21%']

    [x, y] = ColorManager.find 0x408000, start, end
    unless x * y > 0 then return false

    [x0, y0] = Point.new ['8.5%', '11.5%']

    diff = y - y0
    unless diff > 0 then return false

    return ($.abs x - x0) < diff

  move: ->
    $.press 's:down'
    Timer.add 200, ->
      $.press 'space'
      Timer.add 200, ->
        $.press 'space'
        Timer.add 400, ->
          $.press 's:up'

  rotate: ->
    $.press 'x'
    $.press 'd'
    $.press 'm-button'

# execute

follower = new FollowerX()