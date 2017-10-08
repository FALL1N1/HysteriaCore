-- make glyphs available in all builds
update item_template set addedinbuild = 0 where name like '%Glyph of%';