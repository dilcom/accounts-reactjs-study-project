merge = (xs...) ->
  if xs?.length > 0
    tap {}, (m) -> m[k] = v for k, v of x for x in xs
tap = (o, fn)->fn(o); o

window.merge = merge
