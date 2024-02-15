package com.main.controller;

import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import java.io.InputStream;
import java.util.Iterator;

@RestController
public class LeadBulkUploadController {

    @PostMapping("BulkUploadLeads.htm")
    public ResponseEntity<String> BulkUploadLeads(@RequestParam("file") MultipartFile file) {
        try {
            //file validation
            if (file.isEmpty()) {
                return ResponseEntity.badRequest().body("Please upload a file.");
            }
            // Check file extension is excel of not
            String fileName = file.getOriginalFilename();
            if (!fileName.endsWith(".xlsx") && !fileName.endsWith(".xls")) {
                return ResponseEntity.badRequest().body("Only Excel files (XLSX or XLS) are allowed.");
            }
//            System.out.println("File is Valid ..............");
            printExcelData(file);
            return ResponseEntity.ok().body("File content ingestion successful.");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error uploading file: " + e.getMessage());
        }
    }


    private void printExcelData(MultipartFile file)throws Exception{

        DataFormatter df = new DataFormatter();
        try{
            InputStream stream = file.getInputStream();
            Workbook workbook = new XSSFWorkbook(stream);
            Sheet sheet = workbook.getSheet("Refered");
            Iterator<Row> rows = sheet.iterator();

            while (rows.hasNext()) {
                Row currentRow = rows.next();
                Iterator<Cell> cellsInRow = currentRow.iterator();
                while (cellsInRow.hasNext()) {
                    Cell currentCell = cellsInRow.next();
//                    System.out.print(df.formatCellValue(currentCell)+" -- ");
                }
//                System.out.println(" ");
            }
            workbook.close();
        }catch (Exception e){
            e.printStackTrace();
        }

    }
}
