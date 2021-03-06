# This file is part of shinyStan
# Copyright (C) 2015 Jonah Sol Gabry & Stan Development Team
#
# shinyStan is free software; you can redistribute it and/or modify it under the
# terms of the GNU General Public License as published by the Free Software
# Foundation; either version 3 of the License, or (at your option) any later
# version.
# 
# shinyStan is distributed in the hope that it will be useful, but WITHOUT ANY
# WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR
# A PARTICULAR PURPOSE.  See the GNU General Public License for more details.
# 
# You should have received a copy of the GNU General Public License along with
# this program; if not, see <http://www.gnu.org/licenses/>.


load("shinystan_object.RData")
if (file.exists("y.RData")) load("y.RData")


# probability distributions -----------------------------------------------

# t distribution with location and scale
.dt_loc_scale <- function(x, df, location, scale) {
  1/scale * dt((x - location)/scale, df)
}
# inverse gamma distribution
.dinversegamma <- function(x, shape, scale) {
  logout <- log(scale)*shape - lgamma(shape) - (1+shape)*log(x) - (scale/x)
  exp(logout)
}

