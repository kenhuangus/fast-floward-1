// Week 1 Quest 1
pub struct Canvas {

  pub let width: UInt8
  pub let height: UInt8
  pub let pixels: String

  init(width: UInt8, height: UInt8, pixels: String) {
    self.width = width
    self.height = height
    // The following pixels
    // 123
    // 456
    // 789
    // should be serialized as
    // 123456789
    self.pixels = pixels
  }
}

pub resource Picture {
  pub let canvas: Canvas
  
  init(canvas: Canvas) {
    self.canvas = canvas
  }
}

pub fun serializeStringArray(_ lines: [String]): String {
  var buffer = ""
  for line in lines {
    buffer = buffer.concat(line)
  }

  return buffer
}

pub fun display(canvas: Canvas) {
  var heightLoop: UInt8 = 0
  var widthLoop: UInt8 = 0
  var header = "+"

  while widthLoop < canvas.width {
    header = header.concat("-")
    widthLoop = widthLoop + 1
  }
  header = header.concat("+")

  log(header)
  while heightLoop < canvas.height {
    var from = heightLoop * canvas.width
    var upTo = from + canvas.width
    var buffer = "|"
    buffer = buffer.concat(canvas.pixels.slice(from: Int(from), upTo: Int(upTo))).concat("|")
    log(buffer)
    heightLoop = heightLoop + 1
  }
  log(header)
}

pub fun main() {
  let pixelsX = [
    "*   *",
    " * * ",
    "  *  ",
    " * * ",
    "*   *"
  ]
  let canvasX = Canvas(
    width: 5,
    height: 5,
    pixels: serializeStringArray(pixelsX)
  )
  let letterX <- create Picture(canvas: canvasX)
  log(letterX.canvas)
  display(canvas: letterX.canvas);
  destroy letterX
}
 