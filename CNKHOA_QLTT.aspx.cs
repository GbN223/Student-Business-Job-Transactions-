using iTextSharp.text.html.simpleparser;
using iTextSharp.text.pdf;
using iTextSharp.text;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Drawing;
using Font = iTextSharp.text.Font;
using System.Text;
using OfficeOpenXml;
using DocumentFormat.OpenXml.Packaging;
using DocumentFormat.OpenXml.Spreadsheet;
using DocumentFormat.OpenXml;
using System.Data;

namespace NCKH
{
    public partial class CNKHOA_QLTT : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            ExportGridtoExcel();
        }
        private void ExportGridtoExcel()
        {
            ExcelPackage excelPackage = new ExcelPackage();
            ExcelWorksheet worksheet = excelPackage.Workbook.Worksheets.Add("Sheet1");
            for (int i = 0; i < GridView1.Rows.Count; i++)
            {
                for (int j = 0; j < GridView1.Columns.Count; j++)
                {
                    worksheet.Cells[i + 1, j + 1].Value = GridView1.Rows[i].Cells[j].Text;

                    //Set the font to Unicode
                    worksheet.Cells[i + 1, j + 1].Style.Font.Name = "Arial Unicode MS";
                }
            }
            FileInfo excelFile = new FileInfo("C:\\Users\\baoat\\Downloads\\MyExcelFile.xlsx");
            excelPackage.SaveAs(excelFile);
        }
        private DataTable GetGridViewData()
        {
            // Replace this method with your own data source
            DataTable dt = new DataTable();
            dt.Columns.Add("Name");
            dt.Columns.Add("Address");
            dt.Columns.Add("City");

            dt.Rows.Add("John Doe", "123 Main St", "Anytown");
            dt.Rows.Add("Jane Smith", "456 Oak St", "Otherville");

            return dt;
        }
        private void ExportGridToPDF()
        {
           


           

            Response.ContentType = "application/pdf";
            Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
            Response.Cache.SetCacheability(HttpCacheability.NoCache);

            // Create a PDF document
            Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);
            PdfWriter.GetInstance(pdfDoc, Response.OutputStream);

            pdfDoc.Open();

            // Create a font that supports Unicode characters
            string fontPath = Server.MapPath("~/Fonts/arial-unicode-ms.ttf");
            BaseFont bf = BaseFont.CreateFont(fontPath, BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
            Font font = new Font(bf, 10, Font.NORMAL);

            // Create a PDF table with as many columns as the GridView
            PdfPTable pdfTable = new PdfPTable(GridView1.HeaderRow.Cells.Count);

            // Add the GridView header row to the PDF table
            foreach (TableCell headerCell in GridView1.HeaderRow.Cells)
            {
                string encodedText = EncodeToUnicodeEscapeSequence(headerCell.Text);
                pdfTable.AddCell(new Phrase(encodedText, font));
            }

            // Add the GridView data rows to the PDF table
            foreach (GridViewRow gridViewRow in GridView1.Rows)
            {
                foreach (TableCell gridViewCell in gridViewRow.Cells)
                {
                    string encodedText = EncodeToUnicodeEscapeSequence(gridViewCell.Text);
                    pdfTable.AddCell(new Phrase(encodedText, font));
                }
            }

            // Add the PDF table to the PDF document
            pdfDoc.Add(pdfTable);

            // Close the PDF document
            pdfDoc.Close();

            Response.Write(pdfDoc);
            Response.End();
        }
        private static string EncodeToUnicodeEscapeSequence(string text)
        {
            StringBuilder sb = new StringBuilder();
            foreach (char c in text)
            {
                if (c <= 127)
                {
                    sb.Append(c);
                }
                else
                {
                    sb.Append("\\u").Append(((int)c).ToString("x4"));
                }
            }
            return sb.ToString();
        }
        //public override void VerifyRenderingInServerForm(Control control)
        //{
        //    /* Confirms that an HtmlForm control is rendered for the specified ASP.NET
        //       server control at run time. */
        //}
        //public void export()
        //{
        //    Response.ContentType = "application/pdf";
        //    Response.AddHeader("content-disposition", "attachment;filename=GridViewExport.pdf");
        //    Response.Cache.SetCacheability(HttpCacheability.NoCache);

        //    StringWriter sw = new StringWriter();
        //    HtmlTextWriter hw = new HtmlTextWriter(sw);

        //    // Render the GridView to HTML
        //    GridView1.RenderControl(hw);

        //    // Create a PDF document
        //    Document pdfDoc = new Document(PageSize.A4, 10f, 10f, 10f, 0f);

        //    // Set the document encoding to Unicode
        //    PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        //    pdfWriter.SetLanguage("vi");

        //    pdfDoc.Open();

        //    // Create a font that supports Unicode characters
        //    BaseFont bf = BaseFont.CreateFont(@"C:\Windows\Fonts\arial.ttf", BaseFont.IDENTITY_H, BaseFont.EMBEDDED);
        //    Font font = new Font(bf, 10, Font.NORMAL);

        //    // Parse the HTML and add it to the PDF document
        //    HTMLWorker htmlparser = new HTMLWorker(pdfDoc);
        //    htmlparser.SetDefaultCharEncoding("UTF-8");
        //    htmlparser.Parse(new StringReader(sw.ToString()));

        //    // Close the PDF document
        //    pdfDoc.Close();

        //    Response.Write(pdfDoc);
        //    Response.End();
        //}
    }
}