import woexp

exp = woexp.WordExp()
exp.expand("[p-t]*.*")
print exp.result()
exp.expand("*.NONEXIST")
print exp.result()
