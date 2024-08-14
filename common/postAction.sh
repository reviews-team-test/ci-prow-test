#!/bin/sh

createIssueComment(){
    echo "{\"body\":\"$(cat comment.txt)\"}" > comment.data
    sed -i 's/]/]\\n/' comment.data
    sed -i 's/;/\\n/' comment.data
    response_code=$(curl -o /dev/null -sw "%{http_code}\n" -L -X POST \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer ${GITHUB_TOKEN}" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        https://api.github.com/repos/${REPO}/issues/${PULL_NUMBER}/comments \
        -d @comment.data || true)
    [ $response_code -eq 201 ] && echo "创建评论成功" || echo "创建评论失败"
}

# 获取仓库的主要开发语言确定使用的检查工具
getPrimaryLanguage(){
    reStr=$(curl -L \
        -H "Accept: application/vnd.github+json" \
        -H "Authorization: Bearer ${GITHUB_TOKEN}" \
        -H "X-GitHub-Api-Version: 2022-11-28" \
        https://api.github.com/repos/${REPO}/languages \
        | jq -r 'to_entries | sort_by(-.value)[0] | .key')
    echo $reStr
}
