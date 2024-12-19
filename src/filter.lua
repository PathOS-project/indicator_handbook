
function Header(h)
    if h.level == 1 and h.tag == "Header" then
        h.classes:insert("unnumbered")
        return h
    end
end