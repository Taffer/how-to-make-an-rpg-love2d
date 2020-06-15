return {
  version = "1.4",
  luaversion = "5.1",
  tiledversion = "2020.06.12",
  orientation = "orthogonal",
  renderorder = "right-down",
  width = 8,
  height = 7,
  tilewidth = 16,
  tileheight = 16,
  nextlayerid = 2,
  nextobjectid = 1,
  properties = {},
  tilesets = {
    {
      name = "atlas",
      firstgid = 1,
      filename = "atlas.tsx",
      tilewidth = 16,
      tileheight = 16,
      spacing = 0,
      margin = 0,
      columns = 32,
      image = "atlas.png",
      imagewidth = 512,
      imageheight = 512,
      objectalignment = "unspecified",
      tileoffset = {
        x = 0,
        y = 0
      },
      grid = {
        orientation = "orthogonal",
        width = 16,
        height = 16
      },
      properties = {},
      terrains = {},
      tilecount = 1024,
      tiles = {}
    }
  },
  layers = {
    {
      type = "tilelayer",
      x = 0,
      y = 0,
      width = 8,
      height = 7,
      id = 1,
      name = "Tile Layer 1",
      visible = true,
      opacity = 1,
      offsetx = 0,
      offsety = 0,
      properties = {},
      encoding = "lua",
      data = {
        1, 1, 1, 5, 7, 1, 1, 1,
        1, 1, 1, 5, 7, 1, 1, 1,
        1, 1, 1, 5, 7, 1, 2, 3,
        1, 1, 1, 5, 7, 1, 5, 6,
        1, 1, 2, 6, 7, 1, 5, 6,
        1, 1, 5, 6, 7, 1, 8, 9,
        1, 1, 5, 6, 7, 1, 1, 1
      }
    }
  }
}
