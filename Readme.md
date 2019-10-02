# Docker Asciidoctor JP
This repository is to build a docker image for converting Japanese asciidoc documents by asciidoctor.
The image entrypoint is rake that has the below tasks.

* pdf
* html
* reveal

You can convert asciidoc documents to pdf or html files by the above tasks.

## Usage
```
docker build -t your_asciidoctor_jp .
docker run -it --rm -v $(pwd):/documents your_asciidoctor_jp -T
docker run -it --rm -v $(pwd):/documents your_asciidoctor_jp pdf[sample.adoc]
docker run -it --rm -v $(pwd):/documents your_asciidoctor_jp html[sample.adoc]
docker run -it --rm -v $(pwd):/documents your_asciidoctor_jp html[sample.adoc,github]
docker run -it --rm -v $(pwd):/documents your_asciidoctor_jp reveal[sample.adoc]
docker run -it --rm -v $(pwd):/documents your_asciidoctor_jp reveal[sample.adoc,white]
docker run -it --rm -v $(pwd):/documents --entrypoint bash your_asciidoctor_jp
```

## References
* https://github.com/asciidoctor/docker-asciidoctor
* https://github.com/htakeuchi/docker-asciidoctor-jp
* https://github.com/kuboaki/beauty-pdf-using-asciidoctor-pdf

## License
[MIT License](https://opensource.org/licenses/MIT).
