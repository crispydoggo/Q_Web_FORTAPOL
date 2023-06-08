# Q-Study FORTAPOL

This repository contains the resources necessary to conduct and analyze an online Q-study with a group of Mexican criminal investigators. The purpose of this study is to identify the perspectives and attitudes of criminal investigators towards different aspects of their work, including investigative methods, legal frameworks, and institutional practices.

## Requirements

- A group of Mexican criminal investigators who are willing to participate in the study.
- A platform for conducting the study online, we used [EQ Web Sort](https://github.com/shawnbanasick/eq-web-sort) by [shawnbanasick](https://github.com/shawnbanasick).
- Access to Q-methodology software for analyzing the data, such as PQMethod or Factor. We used the `qmethod`package for R developed by [aiorazabala](http://aiorazabala.github.io/qmethod/).

## Procedure

1. Recruit a group of Mexican criminal investigators who are willing to participate in the study.
2. Create a list of statements that represent different perspectives on the investigative process, soft-skills, and legal frameworks.
3. Have participants rank the statements on a scale of agreement using an online platform such as Google Forms or [EQ Web Sort](https://github.com/shawnbanasick/eq-web-sort) .
4. Collect the responses and analyze the data using Q-methodology software such as  `qmethod`package for R developed by [aiorazabala](http://aiorazabala.github.io/qmethod/).
5. Use the results of the analysis to identify the different perspectives held by the participants and to gain insight into the attitudes and beliefs of criminal investigators towards their work.

## Files

- `EQ-Web-Sort-v200`: A folder wich contains the whole backend of the Web Page developed by [EQ Web Sort](https://github.com/shawnbanasick/eq-web-sort).
- `Fase_III`: the same backend of the [EQ Web Sort](https://github.com/shawnbanasick/eq-web-sort) but for the second exercise.
- `analysis.R`: A script for conducting the Q-methodology analysis using R.
- `README.md`: This file.
- `statements_e1.txt`: Are the text file of the statements of the first Q-study: Criminal investigators skills preferences
- `statements_e2.txt`: Are the text file of the statements of the second Q-study: Criminal investigators biases

## Credits

This repository was created by Lothar Mateo for the purpose of conducting and analyzing an online Q-study with a group of Mexican criminal investigators.

## License

This project is licensed under the [MIT License](https://opensource.org/license/mit/). Actually no, but feel free to use and modify these resources for your own purposes, but please give credit to the original author wich is really not me.
