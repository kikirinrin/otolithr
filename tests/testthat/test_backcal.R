context("Back calculation")

test_that("daily calculation works correctly", {
  coef_a <-  0.090964113
  coef_b <-  5.571437625
  expect_equal(backcal_i_maiwashi(a = coef_a, b = coef_b, radius = 6.229),
               6.138053083)

  expect_equal(backcal_i_maiwashi(a = coef_a, b = coef_b, radius = 28.179),
               8.134715359)

  expect_equal(backcal_i_maiwashi(a = coef_a, b = coef_b, radius = 104.509),
               15.07800609)

  expect_equal(backcal_i_maiwashi(a = coef_a, b = coef_b, radius = 191.529),
               22.99370318)

  expect_equal(backcal_i_maiwashi(a = coef_a, b = coef_b, radius = 272.949),
               30.40000125)
})

test_that("whole individual calculation works correctly", {
  data <- list(
    orvec = c(3.612, 6.229, 9.559, 12.25, 15.506, 19.542, 24.143, 28.179,
              32.996, 38.66, 43.759, 50.627, 58.201, 66.556, 74.911, 85.035,
              94.17, 104.509, 114.068, 123.062, 131.767, 140.836, 148.552,
              156.765, 166.465, 175.526, 184.096, 191.529, 200.59, 210.223,
              219.566, 229.266, 240.735, 251.639, 261.904, 272.949, 284.492),
    bl_at_catch = 31.45)
  class(data) <- "maiwashi"
  expect_equal(
    backcal(data),
    c(5.9, 6.138053083, 6.440963579, 6.685748006, 6.981927158, 7.349058317,
      7.7675842, 8.134715359, 8.57288949, 9.088110225, 9.551936236, 10.17667776,
      10.86563995, 11.62564512, 12.38565028, 13.30657096, 14.13752813,
      15.07800609, 15.94753204, 16.76566327, 17.55750587, 18.38245941,
      19.08433851, 19.83142677, 20.71377866, 21.53800449, 22.31756693,
      22.99370318, 23.81792901, 24.69418631, 25.54406401, 26.42641591,
      27.46968332, 28.461556, 29.39530262, 30.40000125, 31.45)
  )
})
 
test_that("back_calculate() works for df", {
  data <- hdr2df("hdrs/soyo_maiwashi.hdr", species = "maiwashi")
  expect_equal(
    data$BackCalBL_mm,
    c(5.9, 6.138053083, 6.440963579, 6.685748006, 6.981927158, 7.349058317,
      7.7675842, 8.134715359, 8.57288949, 9.088110225, 9.551936236, 10.17667776,
      10.86563995, 11.62564512, 12.38565028, 13.30657096, 14.13752813,
      15.07800609, 15.94753204, 16.76566327, 17.55750587, 18.38245941,
      19.08433851, 19.83142677, 20.71377866, 21.53800449, 22.31756693,
      22.99370318, 23.81792901, 24.69418631, 25.54406401, 26.42641591,
      27.46968332, 28.461556, 29.39530262, 30.40000125, 31.45)
  )
  expect_equal(data$BackCalBL_mm[1],
               5.9) # sl at hatch (Takahashi et al. 2008 Can.J.fish)
  expect_equal(max(data$BackCalBL_mm), unique(data$BL_mm))
})
