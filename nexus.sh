#!/bin/bash
node_ids=()
index=1
for id in "${node_ids[@]}"; do 
    while screen -list | grep -q "\.${index}\s"; do ((index++)); done
    screen -S "${index}" -dm bash -c "echo '启动节点: $id'; nexus-network start --node-id $id; exec bash"
    echo "窗口 $index 启动节点 $id"
    ((index++))
done
echo -e "\n运行完毕！\n使用命令查看会话:\nscreen -list\n连接会话示例:\nscreen -r 1"
