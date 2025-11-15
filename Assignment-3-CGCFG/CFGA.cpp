/**
 * ICFG.cpp
 * Assignment 3 - ICFG Path Analysis
 * Name: 胡晨璐
 * Student ID: 3220252746
 */

#include "CFGA.h"
#include <functional>

using namespace SVF;
using namespace llvm;
using namespace std;

int main(int argc, char **argv)
{
    auto moduleNameVec =
            OptionBase::parseOptions(argc, argv, "Whole Program Points-to Analysis",
                                     "[options] <input-bitcode...>");

    LLVMModuleSet::buildSVFModule(moduleNameVec);

    SVFIRBuilder builder;
    auto pag = builder.build();
    auto icfg = pag->getICFG();

    CFGAnalysis analyzer = CFGAnalysis(icfg);

    // TODO: complete the following method: 'CFGAnalysis::analyze'
    analyzer.analyze(icfg);

    analyzer.dumpPaths();
    LLVMModuleSet::releaseLLVMModuleSet();
    return 0;
}


// void CFGAnalysis::analyze(SVF::ICFG *icfg)
// {
//     // Sources and sinks are specified when an analyzer is instantiated.
//     for (auto src : sources)
//         for (auto snk : sinks)
//         {
//             // TODO: DFS the graph, starting from src and detecting the paths ending at snk.
//             // Use the class method 'recordPath' (already defined) to record the path you detected.
//             //@{

//             //@}
//         }
// }

// void CFGAnalysis::analyze(SVF::ICFG *icfg)
// {
//     std::function<void(unsigned, unsigned, std::vector<unsigned>&, std::set<unsigned>&)> dfs;
    
//     dfs = [&](unsigned current, unsigned sink, 
//               std::vector<unsigned> &path, std::set<unsigned> &visited) -> void
//     {
//         path.push_back(current);
//         visited.insert(current);
        
//         if (current == sink)
//         {
//             recordPath(path);
//             path.pop_back();
//             visited.erase(current);
//             return;
//         }
        
//         auto node = icfg->getICFGNode(current);
        
//         if (auto callNode = llvm::dyn_cast<SVF::CallICFGNode>(node))
//         {
//             callStack.push(current);
            
//             for (auto edge : node->getOutEdges())
//             {
//                 unsigned succ = edge->getDstID();
//                 if (visited.find(succ) == visited.end())
//                 {
//                     dfs(succ, sink, path, visited);
//                 }
//             }
            
//             if (!callStack.empty())
//                 callStack.pop();
//         }
//         else if (auto retNode = llvm::dyn_cast<SVF::RetICFGNode>(node))
//         {
//             for (auto edge : node->getOutEdges())
//             {
//                 unsigned succ = edge->getDstID();
//                 if (visited.find(succ) == visited.end())
//                 {
//                     dfs(succ, sink, path, visited);
//                 }
//             }
//         }
//         else
//         {
//             for (auto edge : node->getOutEdges())
//             {
//                 unsigned succ = edge->getDstID();
//                 if (visited.find(succ) == visited.end())
//                 {
//                     dfs(succ, sink, path, visited);
//                 }
//             }
//         }
        
//         path.pop_back();
//         visited.erase(current);
//     };
    
//     for (auto src : sources)
//     {
//         for (auto snk : sinks)
//         {
//             std::vector<unsigned> path;
//             std::set<unsigned> visited;
//             dfs(src, snk, path, visited);
//         }
//     }
// }
void CFGAnalysis::analyze(SVF::ICFG *icfg)
{
    std::function<void(unsigned, unsigned, std::vector<unsigned>&, std::set<unsigned>&)> dfs;
    
    dfs = [&](unsigned current, unsigned sink, 
              std::vector<unsigned> &path, std::set<unsigned> &visited) -> void
    {
        path.push_back(current);
        visited.insert(current);
        
        // 到达sink，记录路径
        if (current == sink)
        {
            recordPath(path);
            path.pop_back();
            visited.erase(current);
            return;
        }
        
        auto node = icfg->getICFGNode(current);
        
        // 处理调用节点
        if (auto callNode = llvm::dyn_cast<SVF::CallICFGNode>(node))
        {
            // 将调用点压栈
            callStack.push(current);
            
            // 遍历所有出边
            for (auto edge : node->getOutEdges())
            {
                unsigned succ = edge->getDstID();
                if (visited.find(succ) == visited.end())
                {
                    dfs(succ, sink, path, visited);
                }
            }
            
            // 探索完成后弹栈
            if (!callStack.empty())
                callStack.pop();
        }
        // 处理返回节点
        else if (auto retNode = llvm::dyn_cast<SVF::RetICFGNode>(node))
        {
            // 返回节点只应该返回到对应的调用点
            for (auto edge : node->getOutEdges())
            {
                unsigned succ = edge->getDstID();
                
                // 检查调用栈是否匹配
                if (!callStack.empty())
                {
                    if (visited.find(succ) == visited.end())
                    {
                        dfs(succ, sink, path, visited);
                    }
                }
            }
        }
        // 普通节点
        else
        {
            for (auto edge : node->getOutEdges())
            {
                unsigned succ = edge->getDstID();
                if (visited.find(succ) == visited.end())
                {
                    dfs(succ, sink, path, visited);
                }
            }
        }
        
        path.pop_back();
        visited.erase(current);
    };
    
    // 对每对source-sink执行DFS
    for (auto src : sources)
    {
        for (auto snk : sinks)
        {
            std::vector<unsigned> path;
            std::set<unsigned> visited;
            callStack = std::stack<unsigned>(); // 清空调用栈
            dfs(src, snk, path, visited);
        }
    }
}
