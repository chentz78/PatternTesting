--Module under test
local EP = require("EqPart")
local BN = require("openssl").bn

--local Util = require("Util")
--local Set = require("Set")

context("Basic tests", function()
  test("TRSize", function()
    local nPatt = 163
    assert_equal(EP.TRSizePPC(nPatt),163)
    assert_equal(EP.TRSizeECPC(nPatt), 163*2)
    assert_equal(EP.TRSizePWPC(nPatt), BN.number(52975))
    assert_equal(EP.TRSizeACPC(nPatt), BN.number("71369776740958021339670709108335728109493553755159680132417903558276857704707733438156372726705031") ) -- float precision error issue
  end)
end)