# baseball-07
온라인 야구게임 - 7팀

* BE: [엘리](https://github.com/bohyeon-n), [Mocha](https://github.com/sedin2)
* FE: [Lime](https://github.com/Lime-Lee)
* iOS: [Delma](https://github.com/delmaSong)

<br>

## Daily Scrum

* 매일 오전 11시 스크럼하고, 스크럼 이후에 Wiki에 작성한다.
* 어제 한 일, 오늘 할 일, 컨디션 공유
* 프로젝트 디렉토리를 FE, BE, iOS로 구분한다.

<br>

## Branch Rule

* `master`: 배포 브랜치
* `dev`: 디폴트 브랜치
* 작업을 시작할 때: 자신의 클래스 개발 브랜치에서 `feature-<클래스>/issue-<이슈번호>`로 브랜치 생성
  * `feature-BE/issue-XXX` : 백엔드 피쳐 개발 브랜치
  * `feature-FE/issue-XXX` : 프론트엔드 피쳐 개발 브랜치
  * `feature-iOS/issue-XXX` : 모바일 iOS 피쳐 개발 브랜치
* PR 메시지에 `Closed #n` 등을 포함시켜 이슈를 닫는다.
* 머지를 완료했으면 기능(feature)브랜치는 github과 local git에 모두 삭제한다.

<br>

## Commit Message Rules

```
[#이슈번호] 타입 :이모지: 설명
ex) [#1] feat :rocket: 기능 추가
```

| 타입 | 이모지 | 설명 |
|--|--|--|
|feat|:rocket: `:rocket:`|새로운 기능 추가|
|fix|:pushpin: `:pushpin:`|버그 수정|
|docs|:page_facing_up: `:page_facing_up:`|문서 수정|
|refactor|:recycle: `:recycle:`|코드 리팩토링|
|style|:art: `:art:`|코드 포맷팅 (코드 변경이 없는 경우)|
|test|:checkered_flag: `:checkered_flag:` |테스트 코드 작성|
|chore|:sparkles: `:sparkles:`|소스 코드를 건들지 않는 작업(빌드 업무 수정)|


<br>

## Issue 및 Pull Request 네이밍 규칙

* Issue 네이밍: [클래스] 제목
* Pull Request 네이밍: [클래스] 제목

<br>


## Wiki Contents
- [Daily Scrum](https://github.com/codesquad-member-2020/baseball-07/wiki/Daily-Scrum)
- [API Document](https://github.com/codesquad-member-2020/baseball-07/wiki/API-Document)
- [BE 요구사항 분석](https://github.com/codesquad-member-2020/baseball-07/wiki/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD-%EB%B6%84%EC%84%9D-BE)
- [FE 요구사항 분석](https://github.com/codesquad-member-2020/baseball-07/wiki/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD-%EB%B6%84%EC%84%9D-FE)
- [iOS 요구사항 분석](https://github.com/codesquad-member-2020/baseball-07/wiki/%EC%9A%94%EA%B5%AC%EC%82%AC%ED%95%AD-%EB%B6%84%EC%84%9D-iOS)