context('test-package')

test_that("api-works", {
    expect_true(is.character(get_keywords('P02678')))
    expect_true(is.character(get_gene('P02678')))
    expect_true(is.character(get_sequence('P02678')))
    expect_true(tibble::is_tibble(go_query('P02678')))
})
