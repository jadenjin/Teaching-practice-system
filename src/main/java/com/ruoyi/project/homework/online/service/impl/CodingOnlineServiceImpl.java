package com.ruoyi.project.homework.online.service.impl;

import com.ruoyi.common.utils.text.Convert;
import com.ruoyi.project.homework.online.domain.CodingOnline;
import com.ruoyi.project.homework.online.mapper.CodingOnlineMapper;
import com.ruoyi.project.homework.online.service.ICodingOnlineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.io.*;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.List;

/**
 * coding_onlineService业务层处理
 *
 * @author JadenChen QQ2955104590
 * @date 2024-03-03
 */
@Service
public class CodingOnlineServiceImpl implements ICodingOnlineService {
    @Autowired
    private CodingOnlineMapper codingOnlineMapper;

    /**
     * 查询coding_online
     *
     * @param id coding_online主键
     * @return coding_online
     */
    @Override
    public CodingOnline selectCodingOnlineById(Long id) {
        return codingOnlineMapper.selectCodingOnlineById(id);
    }

    /**
     * 查询coding_online列表
     *
     * @param codingOnline coding_online
     * @return coding_online
     */
    @Override
    public List<CodingOnline> selectCodingOnlineList(CodingOnline codingOnline) {
        return codingOnlineMapper.selectCodingOnlineList(codingOnline);
    }

    /**
     * 新增coding_online
     *
     * @param codingOnline coding_online
     * @return 结果
     */
    @Override
    public int insertCodingOnline(CodingOnline codingOnline) {
        return codingOnlineMapper.insertCodingOnline(codingOnline);
    }

    /**
     * 修改coding_online
     *
     * @param codingOnline coding_online
     * @return 结果
     */
    @Override
    public int updateCodingOnline(CodingOnline codingOnline) {
        return codingOnlineMapper.updateCodingOnline(codingOnline);
    }

    /**
     * 批量删除coding_online
     *
     * @param ids 需要删除的coding_online主键
     * @return 结果
     */
    @Override
    public int deleteCodingOnlineByIds(String ids) {
        return codingOnlineMapper.deleteCodingOnlineByIds(Convert.toStrArray(ids));
    }

    /**
     * 删除coding_online信息
     *
     * @param id coding_online主键
     * @return 结果
     */
    @Override
    public int deleteCodingOnlineById(Long id) {
        return codingOnlineMapper.deleteCodingOnlineById(id);
    }

    @Override
    public String codeOnline(String pythonCode) {
        // 运行Python代码并获取输出
        String output = runPythonCode(pythonCode);
        return output;
    }

    private String runPythonCode(String code) {
        try {
            // 将Python代码保存到文件
            savePythonCodeToFile(code, "./script.py");

            // 运行Python代码
            String runCommand = "python ./script.py";
            ProcessBuilder runProcessBuilder = new ProcessBuilder(runCommand.split("\\s+"));
            runProcessBuilder.redirectErrorStream(true);
            Process runProcess = runProcessBuilder.start();
            runProcess.waitFor();

            // 读取并获取进程输出
            StringBuilder output = new StringBuilder();
            output.append(readProcessOutput(runProcess));

            // 释放资源
            releaseResources();

            return output.toString();

        } catch (IOException | InterruptedException e) {
            e.printStackTrace();
            return "发生错误：" + e.getMessage();
        }
    }

    private void releaseResources() {
        // 在这里释放相关资源，例如删除生成的文件
        try {
            Files.deleteIfExists(Paths.get("./script.py"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void savePythonCodeToFile(String code, String filePath) {
        // 使用PrintWriter将Python代码保存到文件
        try (PrintWriter writer = new PrintWriter(filePath)) {
            writer.println(code);
        } catch (FileNotFoundException e) {
            e.printStackTrace();
        }
    }

    private String readProcessOutput(Process process) throws IOException {
        // 读取进程输出
        BufferedReader reader = new BufferedReader(new InputStreamReader(process.getInputStream()));
        StringBuilder output = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            output.append(line).append("\n");
        }
        return output.toString();
    }
}
