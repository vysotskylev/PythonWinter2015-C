import woexp

exp = woexp.WordExp("[p-t]*.*")
print exp.result()
exp = woexp.WordExp("*.NONEXIST")
print exp.result()
