REQUIRED_FILES = doc/sprawozdanie.tex doc/sprawozdanie.pdf prog/program.jl prog/program.ipynb

report:
	
	@echo "Checking if required files exist ..."
	@for file in $(REQUIRED_FILES); do \
		test -f $$file && echo "$$file : OK" || (echo "$$file : ERROR" && exit 1); \
	done
	
	@echo "Packing to zadanie.zip ..."
	zip -r zadanie.zip doc prog -x "*.DS_Store" -x "*prog/.ipynb_checkpoints/*"

	@echo "Done."