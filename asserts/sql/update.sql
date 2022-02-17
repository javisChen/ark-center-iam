update iam_api
set name = concat('/iam', iam_api.name), url = concat('/iam', iam_api.url)
where 1 = 1;